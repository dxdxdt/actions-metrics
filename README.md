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
Updated: 2026-04-19T19:37:12.903831+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.728 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.548 |  |
| ap-northeast-2 | 0.644 |  |
| ap-northeast-3 | 0.569 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.957 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.821 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.906 |  |
| ca-central-1 | 0.166 | 16 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.490 |  |
| eu-central-2 | 0.508 |  |
| eu-north-1 | 0.542 |  |
| eu-south-1 | 0.512 |  |
| eu-south-2 | 0.532 |  |
| eu-west-1 | 0.422 |  |
| eu-west-2 | 0.445 |  |
| eu-west-3 | 0.473 |  |
| il-central-1 | 0.663 |  |
| me-central-1 | 0.873 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.198 |  |
| sa-east-1 | 0.593 |  |
| us-east-1 | 0.131 | 4526 |
| us-east-2 | 0.115 | 1516 |
| us-gov-east-1 | 0.126 | 1657 |
| us-gov-west-1 | 0.219 | 194 |
| us-west-1 | 0.161 | 3445 |
| us-west-2 | 0.221 | 156 |

