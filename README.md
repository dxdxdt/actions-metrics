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
Updated: 2026-05-14T13:50:42.283784+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.887 |  |
| ap-east-1 | 0.817 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.731 |  |
| ap-northeast-3 | 0.653 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.900 |  |
| ap-southeast-1 | 0.890 |  |
| ap-southeast-2 | 0.785 |  |
| ap-southeast-3 | 0.944 |  |
| ap-southeast-4 | 0.823 |  |
| ap-southeast-5 | 0.906 |  |
| ap-southeast-6 | 0.823 |  |
| ap-southeast-7 | 0.975 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.410 |  |
| eu-central-2 | 0.425 |  |
| eu-north-1 | 0.468 |  |
| eu-south-1 | 0.424 |  |
| eu-south-2 | 0.444 |  |
| eu-west-1 | 0.331 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.387 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.786 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.519 |  |
| us-east-1 | 0.074 | 4636 |
| us-east-2 | 0.083 | 1593 |
| us-gov-east-1 | 0.092 | 1689 |
| us-gov-west-1 | 0.294 | 195 |
| us-west-1 | 0.239 | 3561 |
| us-west-2 | 0.298 | 158 |

