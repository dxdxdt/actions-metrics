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
Updated: 2026-02-17T18:46:27.610712+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.768 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.589 |  |
| ap-northeast-2 | 0.690 |  |
| ap-northeast-3 | 0.604 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.956 |  |
| ap-southeast-1 | 0.831 |  |
| ap-southeast-2 | 0.767 |  |
| ap-southeast-3 | 0.895 |  |
| ap-southeast-4 | 0.802 |  |
| ap-southeast-5 | 0.855 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.946 |  |
| ca-central-1 | 0.111 | 16 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.490 |  |
| eu-south-1 | 0.471 |  |
| eu-south-2 | 0.479 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.401 |  |
| eu-west-3 | 0.429 |  |
| il-central-1 | 0.611 |  |
| me-central-1 | 0.819 |  |
| me-south-1 | 0.786 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.538 |  |
| us-east-1 | 0.091 | 4135 |
| us-east-2 | 0.083 | 1353 |
| us-gov-east-1 | 0.081 | 1485 |
| us-gov-west-1 | 0.247 | 153 |
| us-west-1 | 0.254 | 3068 |
| us-west-2 | 0.258 | 126 |

