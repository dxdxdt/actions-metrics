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
Updated: 2026-08-31T20:32:36.363491+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.987 |  |
| ap-east-1 | 0.693 |  |
| ap-east-2 | 0.631 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.620 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.656 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.699 |  |
| ap-southeast-5 | 0.790 |  |
| ap-southeast-6 | 0.694 |  |
| ap-southeast-7 | 0.870 |  |
| ca-central-1 | 0.242 | 18 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.504 |  |
| eu-central-2 | 0.526 |  |
| eu-north-1 | 0.587 |  |
| eu-south-1 | 0.543 |  |
| eu-south-2 | 0.543 |  |
| eu-west-1 | 0.435 |  |
| eu-west-2 | 0.470 |  |
| eu-west-3 | 0.486 |  |
| il-central-1 | 0.672 |  |
| me-central-1 | 0.880 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.621 |  |
| us-east-1 | 0.176 | 5076 |
| us-east-2 | 0.189 | 1685 |
| us-gov-east-1 | 0.184 | 1891 |
| us-gov-west-1 | 0.186 | 228 |
| us-west-1 | 0.128 | 4072 |
| us-west-2 | 0.187 | 189 |

