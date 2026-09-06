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
Updated: 2026-09-06T18:46:37.247431+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.948 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.680 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.662 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.834 |  |
| ap-southeast-2 | 0.708 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.838 |  |
| ap-southeast-6 | 0.744 |  |
| ap-southeast-7 | 0.918 |  |
| ca-central-1 | 0.163 | 18 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.459 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.528 |  |
| eu-south-1 | 0.500 |  |
| eu-south-2 | 0.516 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.436 |  |
| eu-west-3 | 0.454 |  |
| il-central-1 | 0.631 |  |
| me-central-1 | 0.863 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.579 |  |
| us-east-1 | 0.129 | 5088 |
| us-east-2 | 0.130 | 1685 |
| us-gov-east-1 | 0.121 | 1899 |
| us-gov-west-1 | 0.231 | 231 |
| us-west-1 | 0.172 | 4086 |
| us-west-2 | 0.231 | 192 |

