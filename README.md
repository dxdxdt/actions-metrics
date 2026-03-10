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
Updated: 2026-03-10T12:41:37.902119+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.744 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.727 |  |
| ap-northeast-3 | 0.646 |  |
| ap-south-1 | 0.888 |  |
| ap-south-2 | 0.931 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.788 |  |
| ap-southeast-3 | 0.922 |  |
| ap-southeast-4 | 0.876 |  |
| ap-southeast-5 | 0.889 |  |
| ap-southeast-6 | 0.894 |  |
| ap-southeast-7 | 0.965 |  |
| ca-central-1 | 0.116 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.416 |  |
| eu-central-2 | 0.441 |  |
| eu-north-1 | 0.478 |  |
| eu-south-1 | 0.450 |  |
| eu-south-2 | 0.450 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.383 |  |
| eu-west-3 | 0.400 |  |
| il-central-1 | 0.587 |  |
| me-central-1 | 0.802 |  |
| me-south-1 | 0.768 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.524 |  |
| us-east-1 | 0.077 | 4253 |
| us-east-2 | 0.087 | 1415 |
| us-gov-east-1 | 0.087 | 1553 |
| us-gov-west-1 | 0.284 | 177 |
| us-west-1 | 0.271 | 3205 |
| us-west-2 | 0.282 | 144 |

