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
Updated: 2026-08-14T17:45:36.077112+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.873 |  |
| ap-east-1 | 0.809 |  |
| ap-east-2 | 0.752 |  |
| ap-northeast-1 | 0.631 |  |
| ap-northeast-2 | 0.740 |  |
| ap-northeast-3 | 0.672 |  |
| ap-south-1 | 0.825 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.889 |  |
| ap-southeast-2 | 0.803 |  |
| ap-southeast-3 | 0.948 |  |
| ap-southeast-4 | 0.837 |  |
| ap-southeast-5 | 0.915 |  |
| ap-southeast-6 | 0.833 |  |
| ap-southeast-7 | 0.995 |  |
| ca-central-1 | 0.111 | 18 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.391 |  |
| eu-central-2 | 0.412 |  |
| eu-north-1 | 0.433 |  |
| eu-south-1 | 0.415 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.314 |  |
| eu-west-2 | 0.350 |  |
| eu-west-3 | 0.373 |  |
| il-central-1 | 0.554 |  |
| me-central-1 | 0.788 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.489 |  |
| us-east-1 | 0.053 | 4995 |
| us-east-2 | 0.083 | 1679 |
| us-gov-east-1 | 0.092 | 1827 |
| us-gov-west-1 | 0.311 | 222 |
| us-west-1 | 0.252 | 3946 |
| us-west-2 | 0.318 | 177 |

