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
Updated: 2026-05-26T19:59:24.322075+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.084 |  |
| ap-east-1 | 0.621 |  |
| ap-east-2 | 0.558 |  |
| ap-northeast-1 | 0.443 |  |
| ap-northeast-2 | 0.552 |  |
| ap-northeast-3 | 0.469 |  |
| ap-south-1 | 0.920 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.702 |  |
| ap-southeast-2 | 0.582 |  |
| ap-southeast-3 | 0.754 |  |
| ap-southeast-4 | 0.621 |  |
| ap-southeast-5 | 0.723 |  |
| ap-southeast-6 | 0.621 |  |
| ap-southeast-7 | 0.807 |  |
| ca-central-1 | 0.326 | 16 |
| ca-west-1 | 0.192 |  |
| eu-central-1 | 0.593 |  |
| eu-central-2 | 0.616 |  |
| eu-north-1 | 0.637 |  |
| eu-south-1 | 0.629 |  |
| eu-south-2 | 0.631 |  |
| eu-west-1 | 0.512 |  |
| eu-west-2 | 0.554 |  |
| eu-west-3 | 0.569 |  |
| il-central-1 | 0.760 |  |
| me-central-1 | 0.990 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.705 |  |
| us-east-1 | 0.263 | 4688 |
| us-east-2 | 0.234 | 1611 |
| us-gov-east-1 | 0.235 | 1706 |
| us-gov-west-1 | 0.112 | 195 |
| us-west-1 | 0.053 | 3608 |
| us-west-2 | 0.110 | 160 |

