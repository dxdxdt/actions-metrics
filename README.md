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
Updated: 2026-09-22T05:41:15.061022+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.036 |  |
| ap-east-1 | 0.648 |  |
| ap-east-2 | 0.589 |  |
| ap-northeast-1 | 0.467 |  |
| ap-northeast-2 | 0.564 |  |
| ap-northeast-3 | 0.493 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.765 |  |
| ap-southeast-2 | 0.647 |  |
| ap-southeast-3 | 0.795 |  |
| ap-southeast-4 | 0.689 |  |
| ap-southeast-5 | 0.768 |  |
| ap-southeast-6 | 0.687 |  |
| ap-southeast-7 | 0.856 |  |
| ca-central-1 | 0.244 | 18 |
| ca-west-1 | 0.182 |  |
| eu-central-1 | 0.538 |  |
| eu-central-2 | 0.554 |  |
| eu-north-1 | 0.587 |  |
| eu-south-1 | 0.578 |  |
| eu-south-2 | 0.600 |  |
| eu-west-1 | 0.477 |  |
| eu-west-2 | 0.496 |  |
| eu-west-3 | 0.536 |  |
| il-central-1 | 0.711 |  |
| me-central-1 | 0.917 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.673 |  |
| us-east-1 | 0.211 | 5111 |
| us-east-2 | 0.209 | 1686 |
| us-gov-east-1 | 0.201 | 1924 |
| us-gov-west-1 | 0.131 | 235 |
| us-west-1 | 0.128 | 4132 |
| us-west-2 | 0.132 | 192 |

