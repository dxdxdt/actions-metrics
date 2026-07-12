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
Updated: 2026-07-12T22:39:55.675339+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.859 |  |
| ap-east-1 | 0.823 |  |
| ap-east-2 | 0.770 |  |
| ap-northeast-1 | 0.647 |  |
| ap-northeast-2 | 0.750 |  |
| ap-northeast-3 | 0.670 |  |
| ap-south-1 | 0.812 |  |
| ap-south-2 | 0.863 |  |
| ap-southeast-1 | 0.898 |  |
| ap-southeast-2 | 0.804 |  |
| ap-southeast-3 | 0.954 |  |
| ap-southeast-4 | 0.855 |  |
| ap-southeast-5 | 0.920 |  |
| ap-southeast-6 | 0.835 |  |
| ap-southeast-7 | 1.002 |  |
| ca-central-1 | 0.098 | 16 |
| ca-west-1 | 0.287 |  |
| eu-central-1 | 0.374 |  |
| eu-central-2 | 0.393 |  |
| eu-north-1 | 0.422 |  |
| eu-south-1 | 0.404 |  |
| eu-south-2 | 0.416 |  |
| eu-west-1 | 0.295 |  |
| eu-west-2 | 0.333 |  |
| eu-west-3 | 0.360 |  |
| il-central-1 | 0.536 |  |
| me-central-1 | 0.736 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.483 |  |
| us-east-1 | 0.044 | 4861 |
| us-east-2 | 0.069 | 1656 |
| us-gov-east-1 | 0.083 | 1741 |
| us-gov-west-1 | 0.318 | 202 |
| us-west-1 | 0.266 | 3772 |
| us-west-2 | 0.319 | 165 |

