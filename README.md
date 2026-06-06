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
Updated: 2026-06-06T13:13:32.995520+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.981 |  |
| ap-east-1 | 0.704 |  |
| ap-east-2 | 0.637 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.547 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.855 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.738 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.207 | 16 |
| ca-west-1 | 0.203 |  |
| eu-central-1 | 0.497 |  |
| eu-central-2 | 0.517 |  |
| eu-north-1 | 0.535 |  |
| eu-south-1 | 0.526 |  |
| eu-south-2 | 0.522 |  |
| eu-west-1 | 0.410 |  |
| eu-west-2 | 0.450 |  |
| eu-west-3 | 0.476 |  |
| il-central-1 | 0.644 |  |
| me-central-1 | 0.790 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.268 |  |
| sa-east-1 | 0.608 |  |
| us-east-1 | 0.165 | 4729 |
| us-east-2 | 0.163 | 1625 |
| us-gov-east-1 | 0.165 | 1709 |
| us-gov-west-1 | 0.205 | 197 |
| us-west-1 | 0.193 | 3636 |
| us-west-2 | 0.205 | 162 |

