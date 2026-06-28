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
Updated: 2026-06-28T18:00:34.829247+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.939 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.697 |  |
| ap-northeast-1 | 0.584 |  |
| ap-northeast-2 | 0.690 |  |
| ap-northeast-3 | 0.608 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.835 |  |
| ap-southeast-2 | 0.717 |  |
| ap-southeast-3 | 0.887 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.857 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.181 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.482 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.376 |  |
| eu-west-2 | 0.409 |  |
| eu-west-3 | 0.429 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.821 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.562 |  |
| us-east-1 | 0.122 | 4799 |
| us-east-2 | 0.119 | 1645 |
| us-gov-east-1 | 0.139 | 1723 |
| us-gov-west-1 | 0.246 | 199 |
| us-west-1 | 0.185 | 3716 |
| us-west-2 | 0.246 | 163 |

