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
Updated: 2026-05-17T17:52:01.660310+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.882 |  |
| ap-east-1 | 0.816 |  |
| ap-east-2 | 0.748 |  |
| ap-northeast-1 | 0.639 |  |
| ap-northeast-2 | 0.746 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.822 |  |
| ap-south-2 | 0.896 |  |
| ap-southeast-1 | 0.885 |  |
| ap-southeast-2 | 0.796 |  |
| ap-southeast-3 | 0.948 |  |
| ap-southeast-4 | 0.844 |  |
| ap-southeast-5 | 0.911 |  |
| ap-southeast-6 | 0.865 |  |
| ap-southeast-7 | 0.994 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.279 |  |
| eu-central-1 | 0.392 |  |
| eu-central-2 | 0.411 |  |
| eu-north-1 | 0.434 |  |
| eu-south-1 | 0.421 |  |
| eu-south-2 | 0.424 |  |
| eu-west-1 | 0.311 |  |
| eu-west-2 | 0.348 |  |
| eu-west-3 | 0.368 |  |
| il-central-1 | 0.552 |  |
| me-central-1 | 0.764 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.491 |  |
| us-east-1 | 0.060 | 4656 |
| us-east-2 | 0.094 | 1598 |
| us-gov-east-1 | 0.093 | 1697 |
| us-gov-west-1 | 0.325 | 195 |
| us-west-1 | 0.278 | 3572 |
| us-west-2 | 0.326 | 158 |

