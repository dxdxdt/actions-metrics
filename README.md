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
Updated: 2026-04-04T14:31:32.791333+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.644 |  |
| ap-northeast-3 | 0.567 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.785 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.840 |  |
| ap-southeast-4 | 0.738 |  |
| ap-southeast-5 | 0.816 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.896 |  |
| ca-central-1 | 0.193 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.495 |  |
| eu-central-2 | 0.502 |  |
| eu-north-1 | 0.531 |  |
| eu-south-1 | 0.512 |  |
| eu-south-2 | 0.528 |  |
| eu-west-1 | 0.396 |  |
| eu-west-2 | 0.447 |  |
| eu-west-3 | 0.473 |  |
| il-central-1 | 0.658 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.596 |  |
| us-east-1 | 0.144 | 4434 |
| us-east-2 | 0.149 | 1478 |
| us-gov-east-1 | 0.139 | 1625 |
| us-gov-west-1 | 0.211 | 191 |
| us-west-1 | 0.165 | 3353 |
| us-west-2 | 0.211 | 153 |

