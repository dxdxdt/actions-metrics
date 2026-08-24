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
Updated: 2026-08-24T23:16:04.512860+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.965 |  |
| ap-east-1 | 0.704 |  |
| ap-east-2 | 0.637 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.787 |  |
| ap-southeast-2 | 0.678 |  |
| ap-southeast-3 | 0.832 |  |
| ap-southeast-4 | 0.728 |  |
| ap-southeast-5 | 0.803 |  |
| ap-southeast-6 | 0.719 |  |
| ap-southeast-7 | 0.890 |  |
| ca-central-1 | 0.228 | 18 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.483 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.547 |  |
| eu-south-1 | 0.514 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.407 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.471 |  |
| il-central-1 | 0.645 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.156 | 5055 |
| us-east-2 | 0.180 | 1683 |
| us-gov-east-1 | 0.171 | 1881 |
| us-gov-west-1 | 0.218 | 227 |
| us-west-1 | 0.157 | 4049 |
| us-west-2 | 0.218 | 186 |

