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
Updated: 2026-06-16T01:41:42.569780+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.913 |  |
| ap-east-1 | 0.752 |  |
| ap-east-2 | 0.684 |  |
| ap-northeast-1 | 0.570 |  |
| ap-northeast-2 | 0.676 |  |
| ap-northeast-3 | 0.596 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.824 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.874 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.930 |  |
| ca-central-1 | 0.165 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.442 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.473 |  |
| eu-south-1 | 0.460 |  |
| eu-south-2 | 0.463 |  |
| eu-west-1 | 0.351 |  |
| eu-west-2 | 0.395 |  |
| eu-west-3 | 0.412 |  |
| il-central-1 | 0.594 |  |
| me-central-1 | 0.811 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.543 |  |
| us-east-1 | 0.104 | 4761 |
| us-east-2 | 0.142 | 1634 |
| us-gov-east-1 | 0.132 | 1713 |
| us-gov-west-1 | 0.255 | 198 |
| us-west-1 | 0.204 | 3670 |
| us-west-2 | 0.267 | 163 |

