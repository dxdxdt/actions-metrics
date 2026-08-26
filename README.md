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
Updated: 2026-08-26T18:51:32.256530+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.662 |  |
| ap-east-2 | 0.599 |  |
| ap-northeast-1 | 0.482 |  |
| ap-northeast-2 | 0.590 |  |
| ap-northeast-3 | 0.508 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.746 |  |
| ap-southeast-2 | 0.642 |  |
| ap-southeast-3 | 0.793 |  |
| ap-southeast-4 | 0.692 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.674 |  |
| ap-southeast-7 | 0.843 |  |
| ca-central-1 | 0.252 | 18 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.526 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.579 |  |
| eu-south-1 | 0.559 |  |
| eu-south-2 | 0.576 |  |
| eu-west-1 | 0.460 |  |
| eu-west-2 | 0.484 |  |
| eu-west-3 | 0.510 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.900 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.193 |  |
| sa-east-1 | 0.646 |  |
| us-east-1 | 0.188 | 5071 |
| us-east-2 | 0.207 | 1684 |
| us-gov-east-1 | 0.218 | 1887 |
| us-gov-west-1 | 0.169 | 228 |
| us-west-1 | 0.121 | 4061 |
| us-west-2 | 0.168 | 189 |

