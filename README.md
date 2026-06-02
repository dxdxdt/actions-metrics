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
Updated: 2026-06-02T18:34:29.877163+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.740 |  |
| ap-east-2 | 0.664 |  |
| ap-northeast-1 | 0.537 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.561 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.786 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.765 |  |
| ap-southeast-5 | 0.812 |  |
| ap-southeast-6 | 0.759 |  |
| ap-southeast-7 | 0.896 |  |
| ca-central-1 | 0.167 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.535 |  |
| eu-south-1 | 0.525 |  |
| eu-south-2 | 0.528 |  |
| eu-west-1 | 0.420 |  |
| eu-west-2 | 0.452 |  |
| eu-west-3 | 0.476 |  |
| il-central-1 | 0.651 |  |
| me-central-1 | 0.919 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.138 | 4712 |
| us-east-2 | 0.112 | 1621 |
| us-gov-east-1 | 0.115 | 1708 |
| us-gov-west-1 | 0.163 | 196 |
| us-west-1 | 0.186 | 3629 |
| us-west-2 | 0.222 | 162 |

