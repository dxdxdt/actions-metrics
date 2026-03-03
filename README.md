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
Updated: 2026-03-03T10:32:13.710010+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.628 |  |
| ap-northeast-1 | 0.504 |  |
| ap-northeast-2 | 0.615 |  |
| ap-northeast-3 | 0.529 |  |
| ap-south-1 | 0.929 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.758 |  |
| ap-southeast-2 | 0.660 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.706 |  |
| ap-southeast-5 | 0.779 |  |
| ap-southeast-6 | 0.731 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.209 | 16 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.519 |  |
| eu-central-2 | 0.532 |  |
| eu-north-1 | 0.579 |  |
| eu-south-1 | 0.541 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.450 |  |
| eu-west-2 | 0.478 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.693 |  |
| me-central-1 | 0.903 |  |
| me-south-1 | 0.863 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.615 |  |
| us-east-1 | 0.175 | 4212 |
| us-east-2 | 0.158 | 1393 |
| us-gov-east-1 | 0.156 | 1526 |
| us-gov-west-1 | 0.180 | 169 |
| us-west-1 | 0.147 | 3163 |
| us-west-2 | 0.176 | 136 |

