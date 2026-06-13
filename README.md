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
Updated: 2026-06-13T15:27:29.383502+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.881 |  |
| ap-east-1 | 0.806 |  |
| ap-east-2 | 0.743 |  |
| ap-northeast-1 | 0.624 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.648 |  |
| ap-south-1 | 0.821 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.883 |  |
| ap-southeast-2 | 0.755 |  |
| ap-southeast-3 | 0.937 |  |
| ap-southeast-4 | 0.807 |  |
| ap-southeast-5 | 0.903 |  |
| ap-southeast-6 | 0.801 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.142 | 16 |
| ca-west-1 | 0.288 |  |
| eu-central-1 | 0.400 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.452 |  |
| eu-south-1 | 0.448 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.370 |  |
| eu-west-3 | 0.382 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.779 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.509 |  |
| us-east-1 | 0.085 | 4752 |
| us-east-2 | 0.102 | 1632 |
| us-gov-east-1 | 0.117 | 1712 |
| us-gov-west-1 | 0.296 | 198 |
| us-west-1 | 0.238 | 3661 |
| us-west-2 | 0.296 | 163 |

