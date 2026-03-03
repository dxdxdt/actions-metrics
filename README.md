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
Updated: 2026-03-03T14:39:10.599027+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.008 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.644 |  |
| ap-northeast-1 | 0.521 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.549 |  |
| ap-south-1 | 0.950 |  |
| ap-south-2 | 0.984 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.683 |  |
| ap-southeast-3 | 0.830 |  |
| ap-southeast-4 | 0.728 |  |
| ap-southeast-5 | 0.793 |  |
| ap-southeast-6 | 0.738 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.177 | 16 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.526 |  |
| eu-north-1 | 0.565 |  |
| eu-south-1 | 0.530 |  |
| eu-south-2 | 0.553 |  |
| eu-west-1 | 0.436 |  |
| eu-west-2 | 0.479 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.686 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.837 |  |
| mx-central-1 | 0.184 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.162 | 4212 |
| us-east-2 | 0.121 | 1394 |
| us-gov-east-1 | 0.132 | 1527 |
| us-gov-west-1 | 0.174 | 169 |
| us-west-1 | 0.184 | 3164 |
| us-west-2 | 0.173 | 137 |

