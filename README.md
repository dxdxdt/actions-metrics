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
Updated: 2026-08-12T22:32:38.570045+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.891 |  |
| ap-east-1 | 0.799 |  |
| ap-east-2 | 0.728 |  |
| ap-northeast-1 | 0.600 |  |
| ap-northeast-2 | 0.719 |  |
| ap-northeast-3 | 0.637 |  |
| ap-south-1 | 0.834 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.873 |  |
| ap-southeast-2 | 0.773 |  |
| ap-southeast-3 | 0.918 |  |
| ap-southeast-4 | 0.811 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.813 |  |
| ap-southeast-7 | 0.978 |  |
| ca-central-1 | 0.130 | 18 |
| ca-west-1 | 0.283 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.439 |  |
| eu-north-1 | 0.460 |  |
| eu-south-1 | 0.441 |  |
| eu-south-2 | 0.455 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.378 |  |
| eu-west-3 | 0.399 |  |
| il-central-1 | 0.574 |  |
| me-central-1 | 0.792 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.082 | 4983 |
| us-east-2 | 0.119 | 1679 |
| us-gov-east-1 | 0.125 | 1822 |
| us-gov-west-1 | 0.285 | 222 |
| us-west-1 | 0.234 | 3933 |
| us-west-2 | 0.286 | 176 |

