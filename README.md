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
Updated: 2026-08-29T02:59:03.370581+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.642 |  |
| ap-northeast-1 | 0.528 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.940 |  |
| ap-southeast-1 | 0.793 |  |
| ap-southeast-2 | 0.676 |  |
| ap-southeast-3 | 0.837 |  |
| ap-southeast-4 | 0.726 |  |
| ap-southeast-5 | 0.812 |  |
| ap-southeast-6 | 0.721 |  |
| ap-southeast-7 | 0.890 |  |
| ca-central-1 | 0.227 | 18 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.481 |  |
| eu-central-2 | 0.506 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.519 |  |
| eu-south-2 | 0.516 |  |
| eu-west-1 | 0.412 |  |
| eu-west-2 | 0.446 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.648 |  |
| me-central-1 | 0.882 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.596 |  |
| us-east-1 | 0.154 | 5073 |
| us-east-2 | 0.185 | 1684 |
| us-gov-east-1 | 0.193 | 1887 |
| us-gov-west-1 | 0.215 | 228 |
| us-west-1 | 0.156 | 4066 |
| us-west-2 | 0.221 | 189 |

