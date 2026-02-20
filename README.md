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
Updated: 2026-02-20T08:33:09.009493+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.879 |  |
| ap-east-1 | 0.798 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.735 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.893 |  |
| ap-southeast-2 | 0.804 |  |
| ap-southeast-3 | 0.947 |  |
| ap-southeast-4 | 0.841 |  |
| ap-southeast-5 | 0.893 |  |
| ap-southeast-6 | 0.830 |  |
| ap-southeast-7 | 0.979 |  |
| ca-central-1 | 0.104 | 16 |
| ca-west-1 | 0.289 |  |
| eu-central-1 | 0.379 |  |
| eu-central-2 | 0.400 |  |
| eu-north-1 | 0.426 |  |
| eu-south-1 | 0.407 |  |
| eu-south-2 | 0.416 |  |
| eu-west-1 | 0.299 |  |
| eu-west-2 | 0.336 |  |
| eu-west-3 | 0.359 |  |
| il-central-1 | 0.554 |  |
| me-central-1 | 0.784 |  |
| me-south-1 | 0.734 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.483 |  |
| us-east-1 | 0.055 | 4151 |
| us-east-2 | 0.086 | 1356 |
| us-gov-east-1 | 0.095 | 1493 |
| us-gov-west-1 | 0.328 | 158 |
| us-west-1 | 0.270 | 3085 |
| us-west-2 | 0.314 | 128 |

