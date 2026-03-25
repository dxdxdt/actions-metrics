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
Updated: 2026-03-25T09:45:28.347164+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.955 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.560 |  |
| ap-northeast-2 | 0.671 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.743 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.787 |  |
| ap-southeast-5 | 0.833 |  |
| ap-southeast-6 | 0.813 |  |
| ap-southeast-7 | 0.927 |  |
| ca-central-1 | 0.138 | 16 |
| ca-west-1 | 0.298 |  |
| eu-central-1 | 0.464 |  |
| eu-central-2 | 0.476 |  |
| eu-north-1 | 0.511 |  |
| eu-south-1 | 0.480 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.389 |  |
| eu-west-2 | 0.418 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.629 |  |
| me-central-1 | 0.824 |  |
| me-south-1 | 0.782 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.569 |  |
| us-east-1 | 0.112 | 4356 |
| us-east-2 | 0.101 | 1452 |
| us-gov-east-1 | 0.094 | 1601 |
| us-gov-west-1 | 0.249 | 190 |
| us-west-1 | 0.200 | 3295 |
| us-west-2 | 0.251 | 151 |

