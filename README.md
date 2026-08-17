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
Updated: 2026-08-17T22:16:09.499411+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.911 |  |
| ap-east-1 | 0.805 |  |
| ap-east-2 | 0.744 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.731 |  |
| ap-northeast-3 | 0.653 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.877 |  |
| ap-southeast-2 | 0.790 |  |
| ap-southeast-3 | 0.946 |  |
| ap-southeast-4 | 0.841 |  |
| ap-southeast-5 | 0.901 |  |
| ap-southeast-6 | 0.827 |  |
| ap-southeast-7 | 0.986 |  |
| ca-central-1 | 0.139 | 18 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.409 |  |
| eu-central-2 | 0.434 |  |
| eu-north-1 | 0.463 |  |
| eu-south-1 | 0.438 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.332 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.394 |  |
| il-central-1 | 0.570 |  |
| me-central-1 | 0.797 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.519 |  |
| us-east-1 | 0.076 | 5014 |
| us-east-2 | 0.102 | 1680 |
| us-gov-east-1 | 0.114 | 1840 |
| us-gov-west-1 | 0.324 | 224 |
| us-west-1 | 0.262 | 3981 |
| us-west-2 | 0.327 | 181 |

