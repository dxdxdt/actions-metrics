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
Updated: 2026-04-22T11:55:11.802219+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.907 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.714 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.713 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.858 |  |
| ap-southeast-2 | 0.777 |  |
| ap-southeast-3 | 0.902 |  |
| ap-southeast-4 | 0.824 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.818 |  |
| ap-southeast-7 | 0.956 |  |
| ca-central-1 | 0.144 | 16 |
| ca-west-1 | 0.295 |  |
| eu-central-1 | 0.416 |  |
| eu-central-2 | 0.440 |  |
| eu-north-1 | 0.487 |  |
| eu-south-1 | 0.451 |  |
| eu-south-2 | 0.454 |  |
| eu-west-1 | 0.348 |  |
| eu-west-2 | 0.377 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.604 |  |
| me-central-1 | 0.821 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.527 |  |
| us-east-1 | 0.084 | 4541 |
| us-east-2 | 0.113 | 1523 |
| us-gov-east-1 | 0.107 | 1661 |
| us-gov-west-1 | 0.300 | 194 |
| us-west-1 | 0.241 | 3458 |
| us-west-2 | 0.294 | 157 |

