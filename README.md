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
Updated: 2026-02-23T04:16:22.987839+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.866 |  |
| ap-east-1 | 0.798 |  |
| ap-east-2 | 0.746 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.738 |  |
| ap-northeast-3 | 0.648 |  |
| ap-south-1 | 0.802 |  |
| ap-south-2 | 0.863 |  |
| ap-southeast-1 | 0.888 |  |
| ap-southeast-2 | 0.814 |  |
| ap-southeast-3 | 0.936 |  |
| ap-southeast-4 | 0.853 |  |
| ap-southeast-5 | 0.903 |  |
| ap-southeast-6 | 0.867 |  |
| ap-southeast-7 | 0.984 |  |
| ca-central-1 | 0.108 | 16 |
| ca-west-1 | 0.284 |  |
| eu-central-1 | 0.380 |  |
| eu-central-2 | 0.404 |  |
| eu-north-1 | 0.429 |  |
| eu-south-1 | 0.412 |  |
| eu-south-2 | 0.414 |  |
| eu-west-1 | 0.306 |  |
| eu-west-2 | 0.342 |  |
| eu-west-3 | 0.359 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.779 |  |
| me-south-1 | 0.732 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.485 |  |
| us-east-1 | 0.054 | 4169 |
| us-east-2 | 0.091 | 1371 |
| us-gov-east-1 | 0.092 | 1501 |
| us-gov-west-1 | 0.316 | 160 |
| us-west-1 | 0.277 | 3099 |
| us-west-2 | 0.313 | 130 |

