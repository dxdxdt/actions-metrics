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
Updated: 2026-08-24T21:21:26.591879+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.960 |  |
| ap-east-1 | 0.728 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.652 |  |
| ap-northeast-3 | 0.574 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.808 |  |
| ap-southeast-2 | 0.703 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.824 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.909 |  |
| ca-central-1 | 0.176 | 18 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.476 |  |
| eu-central-2 | 0.488 |  |
| eu-north-1 | 0.527 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.512 |  |
| eu-west-1 | 0.386 |  |
| eu-west-2 | 0.426 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.217 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.143 | 5054 |
| us-east-2 | 0.148 | 1683 |
| us-gov-east-1 | 0.136 | 1881 |
| us-gov-west-1 | 0.231 | 227 |
| us-west-1 | 0.172 | 4048 |
| us-west-2 | 0.230 | 186 |

