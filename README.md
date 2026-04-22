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
Updated: 2026-04-22T13:08:23.025173+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.881 |  |
| ap-east-1 | 0.802 |  |
| ap-east-2 | 0.736 |  |
| ap-northeast-1 | 0.614 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.637 |  |
| ap-south-1 | 0.853 |  |
| ap-south-2 | 0.938 |  |
| ap-southeast-1 | 0.879 |  |
| ap-southeast-2 | 0.792 |  |
| ap-southeast-3 | 0.923 |  |
| ap-southeast-4 | 0.844 |  |
| ap-southeast-5 | 0.900 |  |
| ap-southeast-6 | 0.841 |  |
| ap-southeast-7 | 0.984 |  |
| ca-central-1 | 0.129 | 16 |
| ca-west-1 | 0.293 |  |
| eu-central-1 | 0.397 |  |
| eu-central-2 | 0.422 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.429 |  |
| eu-south-2 | 0.429 |  |
| eu-west-1 | 0.326 |  |
| eu-west-2 | 0.356 |  |
| eu-west-3 | 0.374 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.785 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.503 |  |
| us-east-1 | 0.068 | 4542 |
| us-east-2 | 0.107 | 1523 |
| us-gov-east-1 | 0.102 | 1661 |
| us-gov-west-1 | 0.320 | 194 |
| us-west-1 | 0.276 | 3458 |
| us-west-2 | 0.319 | 157 |

