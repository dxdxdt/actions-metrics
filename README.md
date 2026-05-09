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
Updated: 2026-05-09T10:50:43.433981+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.865 |  |
| ap-east-1 | 0.811 |  |
| ap-east-2 | 0.745 |  |
| ap-northeast-1 | 0.629 |  |
| ap-northeast-2 | 0.736 |  |
| ap-northeast-3 | 0.655 |  |
| ap-south-1 | 0.818 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.885 |  |
| ap-southeast-2 | 0.804 |  |
| ap-southeast-3 | 0.935 |  |
| ap-southeast-4 | 0.845 |  |
| ap-southeast-5 | 0.907 |  |
| ap-southeast-6 | 0.847 |  |
| ap-southeast-7 | 0.989 |  |
| ca-central-1 | 0.099 | 16 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.375 |  |
| eu-central-2 | 0.390 |  |
| eu-north-1 | 0.411 |  |
| eu-south-1 | 0.394 |  |
| eu-south-2 | 0.409 |  |
| eu-west-1 | 0.288 |  |
| eu-west-2 | 0.328 |  |
| eu-west-3 | 0.356 |  |
| il-central-1 | 0.525 |  |
| me-central-1 | 0.753 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.475 |  |
| us-east-1 | 0.046 | 4616 |
| us-east-2 | 0.090 | 1577 |
| us-gov-east-1 | 0.087 | 1682 |
| us-gov-west-1 | 0.312 | 195 |
| us-west-1 | 0.270 | 3542 |
| us-west-2 | 0.330 | 157 |

