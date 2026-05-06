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
Updated: 2026-05-06T22:42:10.390435+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.911 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.715 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.704 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.853 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.783 |  |
| ap-southeast-3 | 0.921 |  |
| ap-southeast-4 | 0.834 |  |
| ap-southeast-5 | 0.896 |  |
| ap-southeast-6 | 0.849 |  |
| ap-southeast-7 | 0.953 |  |
| ca-central-1 | 0.125 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.427 |  |
| eu-north-1 | 0.476 |  |
| eu-south-1 | 0.432 |  |
| eu-south-2 | 0.444 |  |
| eu-west-1 | 0.334 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.389 |  |
| il-central-1 | 0.564 |  |
| me-central-1 | 0.796 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.517 |  |
| us-east-1 | 0.073 | 4605 |
| us-east-2 | 0.087 | 1570 |
| us-gov-east-1 | 0.086 | 1677 |
| us-gov-west-1 | 0.292 | 194 |
| us-west-1 | 0.241 | 3536 |
| us-west-2 | 0.292 | 157 |

