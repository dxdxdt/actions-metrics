# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-08-09T16:24:50.507053+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.788 |  |
| ap-east-2 | 0.710 |  |
| ap-northeast-1 | 0.600 |  |
| ap-northeast-2 | 0.714 |  |
| ap-northeast-3 | 0.624 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.946 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.750 |  |
| ap-southeast-3 | 0.922 |  |
| ap-southeast-4 | 0.793 |  |
| ap-southeast-5 | 0.872 |  |
| ap-southeast-6 | 0.804 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.145 | 18 |
| ca-west-1 | 0.288 |  |
| eu-central-1 | 0.416 |  |
| eu-central-2 | 0.434 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.447 |  |
| eu-south-2 | 0.456 |  |
| eu-west-1 | 0.340 |  |
| eu-west-2 | 0.376 |  |
| eu-west-3 | 0.398 |  |
| il-central-1 | 0.578 |  |
| me-central-1 | 0.831 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.526 |  |
| us-east-1 | 0.092 | 4963 |
| us-east-2 | 0.113 | 1677 |
| us-gov-east-1 | 0.117 | 1812 |
| us-gov-west-1 | 0.275 | 214 |
| us-west-1 | 0.225 | 3913 |
| us-west-2 | 0.275 | 175 |

