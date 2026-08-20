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
Updated: 2026-08-20T18:26:26.349657+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.876 |  |
| ap-east-1 | 0.802 |  |
| ap-east-2 | 0.741 |  |
| ap-northeast-1 | 0.624 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.659 |  |
| ap-south-1 | 0.837 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.877 |  |
| ap-southeast-2 | 0.782 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.825 |  |
| ap-southeast-5 | 0.900 |  |
| ap-southeast-6 | 0.821 |  |
| ap-southeast-7 | 0.978 |  |
| ca-central-1 | 0.121 | 18 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.392 |  |
| eu-central-2 | 0.416 |  |
| eu-north-1 | 0.465 |  |
| eu-south-1 | 0.428 |  |
| eu-south-2 | 0.430 |  |
| eu-west-1 | 0.324 |  |
| eu-west-2 | 0.359 |  |
| eu-west-3 | 0.375 |  |
| il-central-1 | 0.559 |  |
| me-central-1 | 0.790 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.512 |  |
| us-east-1 | 0.064 | 5030 |
| us-east-2 | 0.085 | 1680 |
| us-gov-east-1 | 0.104 | 1863 |
| us-gov-west-1 | 0.310 | 224 |
| us-west-1 | 0.258 | 4003 |
| us-west-2 | 0.310 | 184 |

