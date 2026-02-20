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
Updated: 2026-02-20T18:36:18.617796+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.055 |  |
| ap-east-1 | 0.638 |  |
| ap-east-2 | 0.580 |  |
| ap-northeast-1 | 0.461 |  |
| ap-northeast-2 | 0.568 |  |
| ap-northeast-3 | 0.489 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.713 |  |
| ap-southeast-2 | 0.599 |  |
| ap-southeast-3 | 0.769 |  |
| ap-southeast-4 | 0.641 |  |
| ap-southeast-5 | 0.737 |  |
| ap-southeast-6 | 0.636 |  |
| ap-southeast-7 | 0.824 |  |
| ca-central-1 | 0.293 | 16 |
| ca-west-1 | 0.185 |  |
| eu-central-1 | 0.586 |  |
| eu-central-2 | 0.617 |  |
| eu-north-1 | 0.631 |  |
| eu-south-1 | 0.604 |  |
| eu-south-2 | 0.629 |  |
| eu-west-1 | 0.503 |  |
| eu-west-2 | 0.524 |  |
| eu-west-3 | 0.573 |  |
| il-central-1 | 0.764 |  |
| me-central-1 | 0.947 |  |
| me-south-1 | 0.924 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.698 |  |
| us-east-1 | 0.235 | 4154 |
| us-east-2 | 0.214 | 1358 |
| us-gov-east-1 | 0.213 | 1493 |
| us-gov-west-1 | 0.122 | 160 |
| us-west-1 | 0.080 | 3087 |
| us-west-2 | 0.121 | 129 |

