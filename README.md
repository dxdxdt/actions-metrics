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
Updated: 2026-03-19T18:45:31.815010+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.545 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.894 |  |
| ap-southeast-1 | 0.786 |  |
| ap-southeast-2 | 0.686 |  |
| ap-southeast-3 | 0.838 |  |
| ap-southeast-4 | 0.727 |  |
| ap-southeast-5 | 0.807 |  |
| ap-southeast-6 | 0.735 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.206 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.484 |  |
| eu-central-2 | 0.507 |  |
| eu-north-1 | 0.559 |  |
| eu-south-1 | 0.522 |  |
| eu-south-2 | 0.533 |  |
| eu-west-1 | 0.449 |  |
| eu-west-2 | 0.460 |  |
| eu-west-3 | 0.477 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.835 |  |
| mx-central-1 | 0.271 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.152 | 4310 |
| us-east-2 | 0.175 | 1437 |
| us-gov-east-1 | 0.174 | 1589 |
| us-gov-west-1 | 0.211 | 189 |
| us-west-1 | 0.153 | 3259 |
| us-west-2 | 0.216 | 148 |

