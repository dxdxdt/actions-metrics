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
Updated: 2026-03-26T17:55:44.454617+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.026 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.606 |  |
| ap-northeast-1 | 0.491 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.516 |  |
| ap-south-1 | 0.912 |  |
| ap-south-2 | 0.910 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.796 |  |
| ap-southeast-4 | 0.678 |  |
| ap-southeast-5 | 0.763 |  |
| ap-southeast-6 | 0.699 |  |
| ap-southeast-7 | 0.850 |  |
| ca-central-1 | 0.258 | 16 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.566 |  |
| eu-north-1 | 0.615 |  |
| eu-south-1 | 0.570 |  |
| eu-south-2 | 0.703 |  |
| eu-west-1 | 0.465 |  |
| eu-west-2 | 0.502 |  |
| eu-west-3 | 0.520 |  |
| il-central-1 | 0.728 |  |
| me-central-1 | 0.915 |  |
| me-south-1 | 0.884 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.658 |  |
| us-east-1 | 0.203 | 4363 |
| us-east-2 | 0.180 | 1456 |
| us-gov-east-1 | 0.180 | 1606 |
| us-gov-west-1 | 0.157 | 190 |
| us-west-1 | 0.100 | 3303 |
| us-west-2 | 0.156 | 151 |

