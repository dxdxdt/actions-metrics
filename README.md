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
Updated: 2026-03-30T16:02:05.116880+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.921 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.697 |  |
| ap-northeast-3 | 0.631 |  |
| ap-south-1 | 0.874 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.792 |  |
| ap-southeast-3 | 0.904 |  |
| ap-southeast-4 | 0.839 |  |
| ap-southeast-5 | 0.865 |  |
| ap-southeast-6 | 0.806 |  |
| ap-southeast-7 | 0.956 |  |
| ca-central-1 | 0.131 | 16 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.430 |  |
| eu-central-2 | 0.450 |  |
| eu-north-1 | 0.481 |  |
| eu-south-1 | 0.453 |  |
| eu-south-2 | 0.457 |  |
| eu-west-1 | 0.361 |  |
| eu-west-2 | 0.386 |  |
| eu-west-3 | 0.408 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.793 |  |
| me-south-1 | 0.740 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.530 |  |
| us-east-1 | 0.084 | 4399 |
| us-east-2 | 0.093 | 1467 |
| us-gov-east-1 | 0.103 | 1615 |
| us-gov-west-1 | 0.275 | 190 |
| us-west-1 | 0.234 | 3321 |
| us-west-2 | 0.286 | 152 |

